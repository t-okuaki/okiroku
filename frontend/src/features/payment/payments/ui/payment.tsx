import { PaymentType } from "@/entities/payment/api/types";
import { formatDateInSecondsFromISO } from "@/shared/lib/date_formatter";

export async function Payment({ payment }: { payment: PaymentType }) {
  return (
    <div className="space-y-2">
      <div className="flex items-center justify-between">
        <div className="font-bold">
          {formatDateInSecondsFromISO(payment.created_at)}
        </div>
        <div className="text-lg font-bold">{payment.price} 円</div>
      </div>
      <div className="space-y-2">
        {payment.payment_items.map((paymentItem) => (
          <div key={paymentItem.id} className="space-y-1">
            <div className="space-x-2 text-sm">
              <div className="inline">{paymentItem.space_name}</div>
              <div className="inline text-gray-400">/</div>
              <div className="inline">{paymentItem.name}</div>
              <div className="inline text-gray-400">{paymentItem.price} 円</div>
              <div className="inline text-gray-400">x {paymentItem.count}</div>
            </div>
            <div>
              {paymentItem.payment_item_works.map((paymentItemWork) => (
                <div key={paymentItemWork.id} className="ml-4 text-xs">
                  <div className="mr-2 inline">{paymentItemWork.name}</div>
                  <div className="inline text-gray-400">
                    {paymentItemWork.count} 個
                  </div>
                </div>
              ))}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
