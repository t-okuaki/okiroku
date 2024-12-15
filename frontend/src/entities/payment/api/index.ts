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

export async function getPayments({ circleId }: { circleId: number }) {
  const response = await fetch(
    `http://backend:3000/circles/${circleId}/payments`,
  );

  if (!response.ok) {
    throw new Error("Failed to fetch payments");
  }

  const payments: PaymentType[] = await response.json();

  return payments;
}
