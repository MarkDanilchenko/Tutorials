<template>
    <section class="my-tutorials__searched">
        <div v-if="tutorial__details" class="d-flex flex-column justify-content-center mt-4">
            <p><i>Title:</i> "{{ tutorial__details.title }}"</p>
            <p><i>Description:</i> <br />"{{ tutorial__details.description }}"</p>
            <p v-if="tutorial__details.published" class="text-end"><i>Published:</i> &#9989;</p>
            <p v-else class="text-end"><i>Published:</i> &#10060;</p>
            <p v-if="tutorial__details.publish_date" class="text-end"><i>Publishe date:</i> {{
                tutorial__details.publish_date }}</p>
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
    name: 'Tutorial__details',
    computed: {
        ...mapState({
            tutorial__details: state => state.tutorials.tutorial__details,
        }),
    },
    methods: {
    },
}

</script>

<style scoped></style>
