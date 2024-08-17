from google.cloud import secretmanager


def access_secret_version(project_id, secret_id, version_id="latest", credentials=None):
    """Access the payload for the given secret version if one exists.
    The versioncan be a version number as a string (e.g. "5") or an
    alias (e.g. "latest")."""

    # Create the Secret Manager client.
    if credentials:
        client = secretmanager.SecretManagerServiceClient(credentials=credentials)
    else:
        client = secretmanager.SecretManagerServiceClient()

    # Build the resource name of the secret version.
    name = f"projects/{project_id}/secrets/{secret_id}/versions/{version_id}"

    # Access the secret version.
    response = client.access_secret_version(request={"name": name})

    # Return the decoded payload.
    payload = response.payload.data.decode("UTF-8")
    return payload