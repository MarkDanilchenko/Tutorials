<template>
    <section class="my-tutorials__item">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button v-if="index == 0" class="accordion-button" type="button" data-bs-toggle="collapse"
                    :data-bs-target="`#collapse${index}`" aria-expanded="true" :aria-controls="`collapse${index}`">
                    <span>Tutorial № {{ index + 1 }}</span>
                </button>
                <button v-else class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                    :data-bs-target="`#collapse${index}`" aria-expanded="false" :aria-controls="`collapse${index}`">
                    <span>Tutorial № {{ index + 1 }}</span>
                </button>
            </h2>
            <div v-if="index == 0" :id="`collapse${index}`" class="accordion-collapse collapse show">
                <div class="accordion-body d-flex justify-content-between align-items-center">
                    <p class="m-0">
                        <span class="text-small text-muted">Tutorial title:</span> <b>"{{ tutorial.title }}"</b>
                    </p>
                    <!-- $emit data for the GET single Tutorial method directly to the Tutorials__page.vue to the getDetailsSingleTutorial(id){} -->
                    <button class="btn btn-outline-custom-green"
                        @click="this.$emit('getDetailsSingleTutorial', tutorial.id)">More</button>
                </div>
            </div>
            <div v-else :id="`collapse${index}`" class="accordion-collapse collapse">
                <div class="accordion-body d-flex justify-content-between align-items-center">
                    <p class="m-0">
                        <span class="text-small text-muted">Tutorial title:</span> <b>"{{ tutorial.title }}"</b>
                    </p>
                    <!-- $emit data for the GET single Tutorial method directly to the Tutorials__page.vue to the getDetailsSingleTutorial(id){} -->
                    <button class="btn btn-outline-custom-green"
                        @click="this.$emit('getDetailsSingleTutorial', tutorial.id)">More</button>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    name: 'Tutorials__item',
    props: {
        tutorial: {
            type: Object
        },
        index: {
            type: Number
        }
    },
}
</script>

<style scoped lang="scss"></style>