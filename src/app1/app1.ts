import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";
import axios from 'axios';

export const handler = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {

  const response = await axios.get('https://catfact.ninja/fact');

  return {
    statusCode: 200,
    body: JSON.stringify(response.data)
  };
}