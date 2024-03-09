<template>
    <div class="container">
        <Navbar />
        <router-view v-slot="{ Component }">
            <transition name="fade" mode="out-in">
                <component :is="Component" />
            </transition>
        </router-view>
        <Footer />
    </div>
</template>

<script>
import eventBus from '@/services/eventBus.js';
import { mapActions, mapGetters, mapMutations, mapState } from 'vuex';
import Navbar from '@/components/Navbar.vue';
import Footer from '@/components/Footer.vue';
export default {
    name: 'App',
    components: {
        Navbar,
        Footer
    },
    mounted() {
        eventBus.on('authError', () => {
            this.signOut_();
        });
        if (localStorage.getItem('refreshToken')) {
            this.userProfile();
        }
    },
    beforeDestroy() {
        eventBus.remove('authError');
    },
    methods: {
        ...mapActions({
            signOut: 'auth/signOut',
            userProfile: 'auth/userProfile',
        }),
        signOut_() {
            if (localStorage.getItem('refreshToken')) {
                this.signOut({ "refresh": localStorage.getItem('refreshToken') })
            } else {
                this.$router.push('/signin');
            }
        }
    }
}
</script>

<style scoped lang="scss">
.fade-enter-active,
.fade-leave-active {
    transition: opacity 0.5s ease;
}

.fade-enter-from,
.fade-leave-to {
    opacity: 0;
}
</style>