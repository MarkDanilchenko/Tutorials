<template>
    <section class="my-tutorials">
        <!-- LOGO -->
        <!-- LOGO -->
        <!-- LOGO -->
        <div id="mainLogo" class="d-flex justify-content-center align-items-center">
            <section class="wrapper">
                <div class="top">Tutorials</div>
                <div class="bottom" aria-hidden="true">Tutorials</div>
            </section>
        </div>
        <!-- Tutorials block -->
        <!-- Tutorials block -->
        <!-- Tutorials block -->
        <div v-if="tutorials.length > 0">
            <div class="row">
                <div class="col-md-6 col-12 mb-md-0 mb-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="my-3 text-muted">Tutorials' list</h5>
                        <!-- radios: (published/all) -->
                        <!-- radios: (published/all) -->
                        <!-- radios: (published/all) -->
                        <div class="d-flex justify-content-center">
                            <div class="form-check me-3">
                                <input class="form-check-input" type="radio" name="radioIsPublished" id="radioAll"
                                    @click="setPublishedTutorial(false)" checked>
                                <label class="form-check-label text-small" for="radioAll">
                                    All
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="radioIsPublished" id="radioPublished"
                                    @click="setPublishedTutorial(true)">
                                <label class="form-check-label text-small" for="radioPublished">
                                    Published only
                                </label>
                            </div>
                        </div>
                    </div>
                    <!-- Tutorials__list -->
                    <!-- Tutorials__list -->
                    <!-- Tutorials__list -->
                    <Tutorials__list :tutorials="displayTutorials" />
                    <!-- Tutorials btns -->
                    <!-- Tutorials btns -->
                    <!-- Tutorials btns -->
                    <div class="d-flex justify-content-center mt-3">
                        <button class="btn btn-outline-custom-green me-3" @click="$router.push('/tutorials/addNew')"
                            type="button">New Tutorial</button>
                        <button class="btn btn-danger" type="button" data-bs-toggle="modal"
                            data-bs-target="#deleteAllTutorials">Delete all</button>
                    </div>
                </div>
                <hr class="d-md-none">
                <div class="col-md-6 col-12">
                    <!-- search Tutorial -->
                    <!-- search Tutorial -->
                    <!-- search Tutorial -->
                    <div class="row d-flex justify-content-between mb-3">
                        <div class="col-4 d-flex align-items-center justify-content-center">
                            <h5 class="m-0 text-muted text-center">&#128269; Tutorial</h5>
                        </div>
                        <div class="col-8 d-flex align-items-center justify-content-center">
                            <div class="form-floating me-1">
                                <input :value="tutorial__searchQuery" @input="setSearchQueryTutorial($event.target.value)"
                                    type="text" class="form-control" name="tutorial__searchInput" id="tutorial__searchInput"
                                    placeholder="Search..." />
                                <label for="tutorial__searchInput" class="text-small text-muted">Search by title ...
                                </label>
                            </div>
                            <button class="btn btn-outline-custom-green" @click="searchTutorial" style="height: 100%;"
                                type="button">Search</button>
                        </div>
                    </div>
                    <!-- Tutorial: emptyField, search result -->
                    <!-- Tutorial: emptyField, search result -->
                    <!-- Tutorial: emptyField, search result -->
                    <div class="row">
                        <transition name="fade" mode="out-in">
                            <component :is="activeComponent"></component>
                        </transition>
                    </div>
                </div>
                <!-- Delete all Tutorials modal -->
                <!-- Delete all Tutorials modal -->
                <!-- Delete all Tutorials modal -->
                <div class="modal fade" tabindex="-1" id="deleteAllTutorials" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Delete All Tutorials</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete all tutorials? <b> <br> This action cannot be undone.</b>
                                </p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-danger" @click="deleteAllTutorials"
                                    data-bs-dismiss="modal">Delete all</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Tutorials: emptyField -->
        <!-- Tutorials: emptyField -->
        <!-- Tutorials: emptyField -->
        <div v-else class="tutorials__empty d-flex flex-column justify-content-center align-items-center">
            <p>No any Tutorial...</p> <br>
            <button class="btn btn-outline-custom-green me-3" @click="$router.push('/tutorials/addNew')" type="button">New
                Tutorial</button>
        </div>
    </section>
</template>

<script>
import Tutorials__list from '@/components/Tutorials__list.vue';
import Tutorial__searched from '@/components/Tutorial__searched.vue';
import Tutorial__emptyFieldLogo from '@/components/Tutorial__emptyFieldLogo.vue';
import { mapState, mapActions, mapGetters, mapMutations } from 'vuex';
export default {
    name: 'Tutorials__page',
    components: {
        Tutorials__list,
        Tutorial__searched,
        Tutorial__emptyFieldLogo
    },
    data() {
        return {
            activeComponent: Tutorial__emptyFieldLogo,
        }
    },
    computed: {
        ...mapState({
            tutorials: state => state.tutorials.tutorials,
            tutorial__searchQuery: state => state.tutorials.tutorial__searchQuery,
            tutorial__published: state => state.tutorials.tutorial__published,
        }),
        ...mapGetters({
            displayTutorials: 'tutorials/displayTutorials',
        }),
    },
    methods: {
        ...mapActions({
            getTutorials: 'tutorials/getTutorials',
            getSearchedTutorial: 'tutorials/getSearchedTutorial',
            deleteTutorials: 'tutorials/deleteTutorials'
        }),
        ...mapMutations({
            setSearchQueryTutorial: 'tutorials/setSearchQueryTutorial',
            setSearchedTutorial: 'tutorials/setSearchedTutorial',
            setPublishedTutorial: 'tutorials/setPublishedTutorial',
        }),
        searchTutorial() {
            this.setSearchedTutorial(null);
            this.getSearchedTutorial();
            this.setSearchQueryTutorial('');
            this.activeComponent = 'Tutorial__searched';
        },
        deleteAllTutorials() {
            this.activeComponent = 'Tutorial__emptyFieldLogo';
            this.deleteTutorials();
        },
    },
    mounted() {
        this.getTutorials();
    },
}
</script>

<style scoped lang="scss">
@import '@/assets/scss/colors.scss';

.tutorials__empty {
    position: relative;
    top: 10vh;
    color: $green-color;
    font-weight: 700;
    font-size: 32px;
}

.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
    opacity: 0;
}
</style>