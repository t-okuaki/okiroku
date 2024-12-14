import { getSpace } from "@/entities/space/api";
import { Items } from "./items";

export async function Space({ id }: { id: number }) {
  const space = await getSpace({ id });

  return (
    <div className="space-y-8">
      <div className="text-lg font-bold">{space.name}</div>
      <Items spaceId={space.id} />
    </div>
  );
}
