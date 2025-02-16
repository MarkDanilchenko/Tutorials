<template>
  <section class="my-tutorialsInfo mt-5">
    <div class="d-flex flex-column justify-content-center">
      <p><b>Title:</b> <br />"{{ tutorial.title }}"</p>
      <p><b>Description:</b> <br />{{ tutorial.description }}</p>
      <div v-if="tutorial.isPublished" class="d-flex justify-content-start flex-column">
        <span><b>Published:</b> &#9989;</span>
        <span><b>Published at:</b> {{ new Date(tutorial.published_at).toLocaleString() }}</span>
      </div>
      <div v-else class="d-flex justify-content-start">
        <span><b>Published:</b> &#10060;</span>
      </div>
      <span><b>Created by:</b> {{ tutorial.created_by.username }}</span>
      <span><b>Created at:</b> {{ new Date(tutorial.created_at).toLocaleString() }}</span>
      <div class="d-flex justify-content-end align-items-center">
        <button
          v-if="isSignedIn && tutorial.created_by.id === profile.id"
          class="btn btn-danger"
          @click="deleteTutorial(tutorial.id)"
        >
          Delete
        </button>
        <button
          v-if="isSignedIn"
          class="btn btn-outline-green-custom ms-1"
          @click="$router.push(`/tutorials/update/${tutorial.id}`)"
        >
          Edit
        </button>
      </div>
    </div>
  </section>
</template>

<script>
import { mapState, mapActions } from "vuex";

export default {
  name: "TutorialInfo",
  computed: {
    ...mapState({
      tutorial: (state) => state.tutorials.tutorial,
      isSignedIn: (state) => state.auth.isSignedIn,
      profile: (state) => state.auth.profile,
    }),
  },
  methods: {
    ...mapActions({
      deleteTutorialItem: "tutorials/deleteTutorialItem",
    }),
    deleteTutorial(id) {
      this.deleteTutorialItem(id);
    },
  },
};
</script>

<style scoped lang="scss"></style>
