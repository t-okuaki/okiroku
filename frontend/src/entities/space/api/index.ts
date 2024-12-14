import { SpaceType } from "./types";

export async function getSpaces({ circleId }: { circleId: number }) {
  const response = await fetch(
    `http://backend:3000/circles/${circleId}/spaces`,
  );
  const spaces: SpaceType[] = await response.json();

  return spaces;
}

export async function getSpace({ id }: { id: number }) {
  const response = await fetch(`http://backend:3000/spaces/${id}`);
  const spaces: SpaceType = await response.json();

  return spaces;
}
