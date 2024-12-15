import { Payments } from "@/features/payment/payments";

export default async function Page({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const id = parseInt((await params).id, 10);

  return (
    <div className="mx-auto max-w-prose px-4 py-8">
      <Payments circleId={id} />
    </div>
  );
}
