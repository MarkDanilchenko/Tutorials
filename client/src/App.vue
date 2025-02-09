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
import colorModeInit from "./mixins/colorModeInit";

export default {
  name: "App",
  components: {
    Navbar,
    Bottom,
  },
  mixins: [colorModeInit],
  mounted() {
    let refresh = localStorage.getItem("refreshToken");

    if (refresh) {
      this.profile();
    }

    eventBus.on("authError", () => {
      refresh = localStorage.getItem("refreshToken");
      this.signOut(refresh);
    });
  },
  beforeUnmount() {
    eventBus.remove("authError");
  },
  methods: {
    ...mapActions({
      invalidateTokens: "auth/invalidateTokens",
      profile: "auth/profile",
    }),
    signOut(refresh) {
      if (refresh) {
        return this.invalidateTokens({ refresh });
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
