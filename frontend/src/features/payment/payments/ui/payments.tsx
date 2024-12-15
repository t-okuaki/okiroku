import { getPayments } from "@/entities/payment/api";
import { Payment } from "./payment";

export async function Payments({ circleId }: { circleId: number }) {
  const payments = await getPayments({ circleId: circleId });

  return (
    <div>
      <div className="mb-12 text-lg font-bold">支払い</div>
      <div className="space-y-4">
        {payments.map((payment) => (
          <div key={payment.id} className="border-b border-gray-500 pb-4">
            <Payment payment={payment} />
          </div>
        ))}
      </div>
    </div>
  );
}
