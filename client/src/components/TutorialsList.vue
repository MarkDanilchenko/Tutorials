<template>
  <section class="my-tutorialsList">
    <div id="TutorialsAccordionPanel" class="accordion">
      <TutorialItem
        v-for="(tutorial, index) in tutorials"
        :key="tutorial.id"
        :tutorial="tutorial"
        :index="index"
        @tutorial-details="$emit('tutorial-details', $event)"
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
  },
  emits: ["tutorial-details"],
};
</script>

<style scoped lang="scss"></style>
