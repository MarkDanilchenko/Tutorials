<template>
  <section class="my-tutorialsList">
    <div id="TutorialsAccordionPanel" class="accordion">
      <TutorialItem
        v-for="(tutorial, index) in tutorials"
        :key="tutorial.id"
        :tutorial="tutorial"
        :index="index"
        :current-page="currentPage"
        :limit="limit"
        @tutorial-info="$emit('tutorial-info', $event)"
      />
    </div>
  </section>
</template>

<script>
import TutorialItem from "@/components/TutorialItem.vue";

export default {
  name: "TutorialsList",
  components: {
    TutorialItem,
  },
  props: {
    tutorials: {
      type: Array,
      default: () => [],
    },
    currentPage: {
      type: Number,
      required: true,
    },
    limit: {
      type: Number,
      required: true,
    },
  },
  emits: ["tutorial-info"],
};
</script>

<style scoped lang="scss"></style>
