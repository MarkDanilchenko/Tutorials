<template>
  <section class="my-notFoundComponent">
    <figure>
      <div class="sad-mac"></div>
      <figcaption>
        <span class="e"></span>
        <span class="r"></span>
        <span class="r"></span>
        <span class="o"></span>
        <span class="r"></span>
        <div></div>
        <span class="_4"></span>
        <span class="_0"></span>
        <span class="_4"></span>
        <div></div>
        <span class="n"></span>
        <span class="o"></span>
        <span class="t"></span>
        <span class="f"></span>
        <span class="o"></span>
        <span class="u"></span>
        <span class="n"></span>
        <span class="d"></span>
      </figcaption>
      <button v-if="isSignedIn" class="btn btn-outline-green-custom" @click="$router.push('/tutorials/create')">
        New Tutorial
      </button>
    </figure>
  </section>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "NotFound",
  computed: {
    ...mapState({
      isSignedIn: (state) => state.auth.isSignedIn,
    }),
  },
};
</script>

<style scoped lang="scss"></style>
