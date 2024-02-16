<template>
    <section class="my-tutorials">
        <div id="mainLogo" class="d-flex justify-content-center align-items-center">
            <section class="wrapper">
                <div class="top">Tutorials</div>
                <div class="bottom" aria-hidden="true">Tutorials</div>
            </section>
        </div>
        <div v-if="tutorials.length > 0">
            <div class="row">
                <div class="col-md-6 col-12 mb-md-0 mb-4">
                    <h5 class="my-3 text-muted">Tutorials' list</h5>
                    <Tutorials__list :tutorials="tutorials" />
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
                    <!-- search result -->
                    <!-- search result -->
                    <!-- search result -->
                    <div class="row">
                        <component :is="activeComponent"></component>
                    </div>
                </div>
            </div>
        </div>
        <div v-else class="tutorials__empty d-flex justify-content-center align-items-center">
            No any Tutorial...
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
            tutorial__searchQuery: state => state.tutorials.tutorial__searchQuery
        }),
        ...mapGetters({
        }),
    },
    methods: {
        ...mapActions({
            getAllTutorials: 'tutorials/getAllTutorials',
            getSearchedTutorial: 'tutorials/getSearchedTutorial'
        }),
        ...mapMutations({
            setSearchQueryTutorial: 'tutorials/setSearchQueryTutorial'
        }),
        searchTutorial() {
            this.activeComponent = 'Tutorial__searched';
            this.getSearchedTutorial();
            this.setSearchQueryTutorial('');
        }
    },
    mounted() {
        this.getAllTutorials();
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
    text-shadow: 0px 0px 10px $green-color;
}
</style>