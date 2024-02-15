<template>
    <section class="my-tutorials__list">
        <div class="accordion" id="TutorialsAccordionPanel">
            <Tutorial__item v-for="tutorial, index in tutorials" :key="tutorial.id" :tutorial="tutorial" :index="index" />
        </div>
    </section>
</template>

<script>
import Tutorial__item from '@/components/Tutorial__item.vue';
export default {
    name: 'Tutorials__list',
    props: {
        tutorials: {
            type: Array
        }
    },
    components: {
        Tutorial__item
    },
}
</script>

<style scoped></style>