class PaymentsController < ApplicationController
  def index
    # TODO: スコープ
    @payments =
      Payment.where(circle_id: params[:circle_id]).
      preload(payment_items: [ :payment_item_works ]).
      order(created_at: :desc)
  end

  # TODO: リクエストパラメーターのバリデーション。
  # TODO: リクエスト時点のユーザーが見ている情報と、実際のデータベースの情報が一致しない可能性を考慮。
  def create
    circle = Circle.find_by(id: params[:circle_id])
    raise NotFound unless circle

    @payment = Payment.new(circle: circle, **payment_params)

    item_ids = payment_items_params.map { |_params| _params[:item_id] }
    items = Item.where(id: item_ids).preload(:space, :works)

    payment_items_params.each do |payment_item_params|
      item_id = payment_item_params[:item_id]
      item_count = payment_item_params[:count]

      item = items.detect { |_item| _item.id == item_id }
      raise NotFound unless item

      payment_item =
        PaymentItem.new(
          item:,
          space: item.space,
          name: item.name,
          price: item.price,
          count: item_count,
          space_name: item.space.name
        )

      item.item_works.each do |item_work|
        payment_item_work =
          PaymentItemWork.new(
            work: item_work.work,
            name: item_work.work.name,
            count: item_work.work_count
          )

        payment_item.payment_item_works << payment_item_work
      end

      @payment.payment_items << payment_item
    end

    # TODO: 認可

    @payment.save!
  end

  private

  def payment_params
    params.expect(payment: [ :price ])
  end

  def payment_items_params
    params.expect(payment: [ payment_items: [ [ :item_id, :count ] ] ])[:payment_items]
  end
end
