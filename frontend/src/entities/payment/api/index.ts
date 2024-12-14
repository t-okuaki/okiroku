import { PaymentType } from "./types";

export async function createPayment({
  circleId,
  body,
}: {
  circleId: number;
  body: {
    payment: {
      price: number;
      payment_items: { item_id: number; count: number }[];
    };
  };
}) {
  const response = await fetch(
    `http://backend:3000/circles/${circleId}/payments`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(body),
    },
  );

  if (!response.ok) {
    throw new Error("Failed to create payment");
  }

  const payment: PaymentType = await response.json();

  return payment;
}
