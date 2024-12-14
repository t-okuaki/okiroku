import { SpacePaymentCreation } from "@/features/payment/space_payment_creation/ui/space_payment_creation";

export default async function Page({ params }: { params: { id: string } }) {
  const id = parseInt((await params).id, 10);

  return (
    <div className="mx-auto max-w-prose py-8">
      <SpacePaymentCreation spaceId={id} />
    </div>
  );
}
