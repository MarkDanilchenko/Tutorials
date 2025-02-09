const { DJANGO_SERVER_HOST, DJANGO_SERVER_PORT } = process.env;

const djangoOptions = {
  host: DJANGO_SERVER_HOST || "127.0.0.1",
  port: DJANGO_SERVER_PORT || 8000,
};

export { djangoOptions };
