<template>
  <div class="container">
    <Navbar />
    <router-view v-slot="{ Component }">
      <transition name="fade" mode="out-in">
        <component :is="Component" />
      </transition>
    </router-view>
    <Bottom />
  </div>
</template>

<script>
import eventBus from "@/services/eventBus.js";
import Navbar from "@/components/Navbar.vue";
import Bottom from "@/components/Bottom.vue";
import { mapActions } from "vuex";

export default {
  name: "App",
  components: {
    Navbar,
    Bottom,
  },
  mounted() {
    let refresh = localStorage.getItem("refreshToken");

    if (refresh) {
      this.userProfile();
    }

    eventBus.on("authCheck", () => {
      refresh = localStorage.getItem("refreshToken");
      this.authCheck(refresh);
    });
  },
  beforeUnmount() {
    eventBus.remove("authCheck");
  },
  methods: {
    ...mapActions({
      signOut: "auth/signOut", // TODO rename this method in vuex
      userProfile: "auth/userProfile",
    }),
    authCheck(refresh) {
      if (refresh) {
        return this.signOut({ refresh });
      }

      this.$router.push("/signin");
    },
  },
};
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
