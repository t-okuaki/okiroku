import { createPayment } from "@/entities/payment/api";
import { Space } from "@/features/payment/space_payment_creation/ui/space";
import { Button } from "@/shared/ui/button";

export async function SpacePaymentCreation({ spaceId }: { spaceId: number }) {
  // TODO
  const circleId = 2;

  async function action(formData: FormData) {
    "use server";

    // TODO: 入力値のバリデーション

    const price = parseInt(formData.get("price") as string, 10);

    console.log(
      '=== type of formData.get("price")',
      typeof formData.get("price"),
    );
    console.log('=== formData.get("price")', formData.get("price"));
    console.log(
      "=== formData.get(`item-count-1`)",
      formData.get(`item-count-1`),
    );

    const body = {
      payment: {
        price: price,
        payment_items: [
          // TODO
          {
            item_id: 1,
            count: parseInt(formData.get(`item-count-1`) as string, 10),
          },
          {
            item_id: 2,
            count: parseInt(formData.get(`item-count-2`) as string, 10),
          },
        ],
      },
    };

    createPayment({ circleId, body });
  }

  return (
    <form action={action}>
      <div className="mb-12">
        <Space id={spaceId} />
      </div>
      <div className="mb-4">
        <label htmlFor="price" className="flex items-center">
          <div className="mr-2">合計 ¥</div>
          <input
            type="number"
            name="price"
            className="rounded border border-gray-100 bg-transparent px-2 py-1"
          />
        </label>
      </div>
      <Button type="submit">記録</Button>
    </form>
  );
}
