import { getRandomCatFact } from "/opt/nodejs/services/service-one";

export const handler = async (event: any) => {

  const response = await getRandomCatFact();

  return {
    statusCode: 200,
    body: JSON.stringify(response)
  };
}