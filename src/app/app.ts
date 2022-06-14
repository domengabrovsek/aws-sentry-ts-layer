import { AWSLambda } from '@sentry/serverless';
import { APIGatewayProxyEvent, APIGatewayProxyResult } from "aws-lambda";

AWSLambda.init({
  dsn: process.env.SENTRY_DSN,
  tracesSampleRate: 1.0
});

const lambda = async (event: APIGatewayProxyEvent): Promise<APIGatewayProxyResult> => {
  const queries = JSON.stringify(event.queryStringParameters);
  return {
    statusCode: 200,
    body: `Queries: ${queries}`
  }
}

export const handler = AWSLambda.wrapHandler(lambda);