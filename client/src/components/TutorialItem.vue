<template>
  <section class="my-tutorialsItem">
    <div class="accordion-item">
      <h2 class="accordion-header">
        <button
          v-if="index == 0"
          class="accordion-button"
          data-bs-toggle="collapse"
          aria-expanded="true"
          :data-bs-target="`#collapse${index}`"
          :aria-controls="`collapse${index}`"
        >
          <span>Tutorial № {{ index + 1 }}</span>
        </button>
        <button
          v-else
          class="accordion-button collapsed"
          data-bs-toggle="collapse"
          aria-expanded="false"
          :data-bs-target="`#collapse${index}`"
          :aria-controls="`collapse${index}`"
        >
          <span>Tutorial № {{ index + 1 }}</span>
        </button>
      </h2>
      <div v-if="index == 0" :id="`collapse${index}`" class="accordion-collapse collapse show">
        <div class="accordion-body d-flex justify-content-between align-items-center">
          <p class="m-0">
            <span><b>Title:</b></span> "{{ tutorial.title }}"
          </p>
          <!-- $emit data for the Tutorials details -->
          <button class="btn btn-outline-green-custom" @click="$emit('tutorial-details', tutorial.id)">More</button>
        </div>
      </div>
      <div v-else :id="`collapse${index}`" class="accordion-collapse collapse">
        <div class="accordion-body d-flex justify-content-between align-items-center">
          <p class="m-0">
            <span><b>Title:</b></span> "{{ tutorial.title }}"
          </p>
          <!-- $emit data for the Tutorials details -->
          <button class="btn btn-outline-green-custom" @click="$emit('tutorial-details', tutorial.id)">More</button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: "TutorialItem",
  props: {
    tutorial: {
      type: Object,
      required: true,
    },
    index: {
      type: Number,
      required: true,
    },
  },
  emits: ["tutorial-details"],
};
</script>

<style scoped lang="scss"></style>
