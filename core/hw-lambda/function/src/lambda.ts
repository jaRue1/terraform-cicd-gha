import { APIGatewayProxyHandler } from 'aws-lambda';
import dotenv from 'dotenv';
dotenv.config();

export const handler: APIGatewayProxyHandler = async (event: any) => {
  const customText = event.queryStringParameters?.text || "Hello World";
  return {
    statusCode: 200,
    body: JSON.stringify({ 
      environment: process.env.LAMBDA_ENVIRONMENT,   
      message: process.env.LAMBDA_MESSAGE,
      customText: customText, 
    }),
  };
};
