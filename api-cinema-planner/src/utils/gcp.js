const { SecretManagerServiceClient } = require("@google-cloud/secret-manager");
const client = new SecretManagerServiceClient();

exports.accessSecret = async (secret, version = "latest") => {
  const [accessResponse] = await client.accessSecretVersion({
    name: `projects/${process.env.GOOGLE_CLOUD_PROJECT}/secrets/${secret}/versions/${version}`,
  });

  const responsePayload = accessResponse.payload.data.toString("utf8");
  return responsePayload;
};
