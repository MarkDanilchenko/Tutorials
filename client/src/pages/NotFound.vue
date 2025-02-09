<template>
  <section class="my-notFound">
    <div class="d-flex flex-column justify-content-center align-items-center notFoundPage">
      <p class="text-center">
        <span class="text-green">404</span>
        <br />Page not found
      </p>
      <button class="btn btn-outline-green-custom" @click="$router.go(-1)">Back</button>
    </div>
  </section>
</template>

<script>
export default {
  name: "NotFound__page",
};
</script>

<style scoped lang="scss">
.notFoundPage {
  font-size: 5rem;
  position: absolute;
  top: 45%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
