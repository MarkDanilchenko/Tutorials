<template>
    <section class="my-tutorials__details">
        <div v-if="tutorial__details" class="d-flex flex-column justify-content-center mt-4">
            <p><i>Title:</i> "{{ tutorial__details.title }}"</p>
            <p><i>Description:</i> <br />"{{ tutorial__details.description }}"</p>
            <p v-if="tutorial__details.published" class="text-end"><i>Published:</i> &#9989;</p>
            <p v-else class="text-end"><i>Published:</i> &#10060;</p>
            <p v-if="tutorial__details.publish_date" class="text-end"><i>Publish date:</i> {{
                tutorial__details.publish_date }}</p>
            <p v-else class="text-end"><i>Publish date:</i> -</p>
            <!-- update/delete btns -->
            <!-- update/delete btns -->
            <!-- update/delete btns -->
            <div class="d-flex justify-content-end align-items-center">
                <button type="button" class="btn btn-outline-custom-green me-1"
                    @click="this.$router.push({ path: `/tutorials/update/${tutorial__details.id}` })">Edit</button>
                <button type="button" class="btn btn-danger" @click="deleteTutorial(tutorial__details.id)">Delete</button>
            </div>

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
        ...mapActions({
            deleteSingleTutorial: 'tutorials/deleteSingleTutorial',
        }),
        deleteTutorial(id) {
            this.deleteSingleTutorial(id);
            this.$router.push({ path: '/tutorials' }).then((response) => {
                window.location.reload();
            });
        },
    },
}

</script>

<style scoped lang="scss"></style>
