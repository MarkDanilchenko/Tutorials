const { VUE_APP_DJANGO_SERVER_HOST, VUE_APP_DJANGO_SERVER_PORT } = process.env;

const djangoOptions = {
  host: VUE_APP_DJANGO_SERVER_HOST || "127.0.0.1",
  port: VUE_APP_DJANGO_SERVER_PORT || 8000,
};

export { djangoOptions };
