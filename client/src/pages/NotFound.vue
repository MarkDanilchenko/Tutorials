<template>
  <section class="my-notFoundPage">
    <div class="d-flex flex-column justify-content-center align-items-center notFoundPage">
      <p class="text-center">
        <span class="text-green">404</span>
        <br />Page not found
      </p>
      <button class="btn btn-outline-secondary" @click="$router.go(-1)">Back</button>
    </div>
  </section>
</template>

<script>
export default {
  name: "NotFound",
};
</script>

<style scoped lang="scss"></style>
