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
                    <Tutorials__list :tutorials="tutorials" />
                </div>
                <hr class="d-md-none">
                <div class="col-md-6 col-12">
                    
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste, quo unde. Quidem deserunt magni
                        laudantium optio laborum aperiam nulla porro omnis accusantium, iste perferendis numquam rem
                        consectetur maiores quas modi?</p>
                
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
import { mapState, mapActions, mapGetters, mapMutations } from 'vuex';
export default {
    name: 'Tutorials__page',
    components: {
        Tutorials__list
    },
    computed: {
        ...mapState({
            tutorials: state => state.tutorials.tutorials
        }),
        ...mapGetters({
        }),
    },
    methods: {
        ...mapActions({
            getAllTutorials: 'tutorials/getAllTutorials'
        }),
        ...mapMutations({
        }),
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