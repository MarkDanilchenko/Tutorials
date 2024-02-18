<template>
    <section class="my-tutorials__searched">
        <div v-if="tutorial__searched" class="d-flex flex-column justify-content-center mt-4">
            <p><i>Title:</i> "{{ tutorial__searched.title }}"</p>
            <p><i>Description:</i> <br />"{{ tutorial__searched.description }}"</p>
            <p v-if="tutorial__searched.published" class="text-end"><i>Published:</i> &#9989;</p>
            <p v-else class="text-end"><i>Published:</i> &#10060;</p>
            <p v-if="tutorial__searched.publish_date" class="text-end"><i>Publishe date:</i> {{ tutorial__searched.publish_date }}</p>
            <p v-else class="text-end"><i>Publishe date:</i> -</p>
        </div>
        <div v-else class="text-center">Tutorial <span class="text-green">not found!</span>
            <br>Please, try again or check your request!
        </div>
    </section>
</template>

<script>
import { mapState, mapActions, mapGetters, mapMutations } from 'vuex';
export default {
    name: 'Tutorial__searched',
    computed: {
        ...mapState({
            tutorial__searched: state => state.tutorials.tutorial__searched
        }),
    },
    methods: {
    },
}

</script>

<style scoped></style>
