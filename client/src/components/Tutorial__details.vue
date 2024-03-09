<template>
    <section class="my-tutorials__details">
        <!-- Tutorials: details -->
        <!-- Tutorials: details -->
        <!-- Tutorials: details -->
        <div v-if="tutorial__details" class="d-flex flex-column justify-content-center mt-4">
            <p><b>Title:</b> "{{ tutorial__details.title }}"</p>
            <p><b>Description:</b> <br />"{{ tutorial__details.description }}"</p>
            <div class="d-flex justify-content-between">
                <p v-if="tutorial__details.published" class="text-end"><b>Published:</b> &#9989;</p>
                <p v-else class="text-end"><b>Published:</b> &#10060;</p>
                <p v-if="tutorial__details.publish_date" class="text-end"><b>Publish date:</b> {{
            tutorial__details.publish_date }}</p>
                <p v-else class="text-end"><b>Publish date:</b> -</p>
            </div>
            <!-- update/delete btns -->
            <!-- update/delete btns -->
            <!-- update/delete btns -->
            <div class="d-flex justify-content-end align-items-center">
                <button v-if="currentUserSignedIn" type="button" class="btn btn-outline-custom-green me-1"
                    @click="this.$router.push({ path: `/tutorials/update/${tutorial__details.id}` })">Edit</button>
                <button v-if="currentUserProfile && currentUserProfile.profile.is_staff" type="button" class="btn btn-danger"
                    @click="deleteTutorial(tutorial__details.id)">Delete</button>
            </div>
        </div>
        <!-- Tutorial not found block -->
        <!-- Tutorial not found block -->
        <!-- Tutorial not found block -->
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
            currentUserSignedIn: state => state.auth.currentUserSignedIn,
            currentUserProfile: state => state.auth.currentUserProfile,
        }),
    },
    methods: {
        ...mapActions({
            deleteSingleTutorial: 'tutorials/deleteSingleTutorial',
        }),
        deleteTutorial(id) {
            this.deleteSingleTutorial(id);
        },
    },
}

</script>

<style scoped lang="scss"></style>
