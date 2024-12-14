import { Items } from "./items";
import { getSpaces } from "@/entities/space/api";

type Space = {
  id: number;
  name: string;
};

export async function Spaces() {
  const spaces = await getSpaces({ circleId: 2 });

  return (
    <div>
      {spaces.map((space: Space) => (
        <div key={space.id}>
          <div className="text-lg">{space.name}</div>
          <Items spaceId={space.id} />
        </div>
      ))}
    </div>
  );
}
