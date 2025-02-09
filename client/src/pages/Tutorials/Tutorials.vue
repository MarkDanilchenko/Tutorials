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
          <!-- radios: (published/all) -->
          <!-- radios: (published/all) -->
          <!-- radios: (published/all) -->
          <div class="d-flex justify-content-between align-items-center">
            <h5 class="my-3 text-muted">All Tutorials</h5>
            <div class="d-flex justify-content-center">
              <div class="form-check me-3">
                <input
                  id="radioAll"
                  class="form-check-input"
                  type="radio"
                  name="radioIsPublished"
                  checked
                  @click="setPublishedTutorial(false)"
                />
                <label class="form-check-label text-small" for="radioAll"> All </label>
              </div>
              <div class="form-check">
                <input
                  id="radioPublished"
                  class="form-check-input"
                  type="radio"
                  name="radioIsPublished"
                  @click="setPublishedTutorial(true)"
                />
                <label class="form-check-label text-small" for="radioPublished"> Published </label>
              </div>
            </div>
          </div>
          <!-- Tutorials__list -->
          <!-- Tutorials__list -->
          <!-- Tutorials__list -->
          <Tutorials__list :tutorials="displayTutorials" @get-details-single-tutorial="getDetailsSingleTutorial" />
          <!-- Tutorials add/del btns -->
          <!-- Tutorials add/del btns -->
          <!-- Tutorials add/del btns -->
          <div class="d-flex justify-content-center mt-3">
            <button
              v-if="currentUserSignedIn"
              class="btn btn-outline-green-custom me-3"
              type="button"
              @click="$router.push('/tutorials/addNew')"
            >
              New Tutorial
            </button>
            <button
              v-if="currentUserProfile && currentUserProfile.profile.is_staff"
              class="btn btn-danger"
              type="button"
              data-bs-toggle="modal"
              data-bs-target="#deleteAllTutorials"
            >
              Delete all
            </button>
          </div>
        </div>
        <div class="d-md-none">
          <hr />
        </div>
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
                <input
                  id="tutorial__searchInput"
                  :value="tutorial__searchQuery"
                  type="text"
                  class="form-control"
                  name="tutorial__searchInput"
                  placeholder="Search..."
                  @input="setSearchQueryTutorial($event.target.value)"
                />
                <label for="tutorial__searchInput" class="text-small text-muted">Search by title ... </label>
              </div>
              <button class="btn btn-outline-green-custom" style="height: 100%" type="button" @click="searchTutorial">
                Search
              </button>
            </div>
          </div>
          <!-- Tutorial: emptyField, searched-details components -->
          <!-- Tutorial: emptyField, searched-details components -->
          <!-- Tutorial: emptyField, searched-details components -->
          <div class="row">
            <transition name="fade" mode="out-in">
              <component :is="activeComponent"></component>
            </transition>
          </div>
        </div>
        <!-- Delete all Tutorials modal -->
        <!-- Delete all Tutorials modal -->
        <!-- Delete all Tutorials modal -->
        <div id="deleteAllTutorials" class="modal fade" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Delete All Tutorials</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <p>
                  Are you sure you want to delete all tutorials?
                  <b>
                    <br />
                    This action cannot be undone!</b
                  >
                </p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" data-bs-dismiss="modal" @click="deleteAllTutorials">
                  Delete all
                </button>
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
      <p>No any Tutorial...</p>
      <br />
      <button
        v-if="currentUserSignedIn"
        class="btn btn-outline-green-custom me-3"
        type="button"
        @click="$router.push('/tutorials/addNew')"
      >
        New Tutorial
      </button>
    </div>
  </section>
</template>

<script>
import Tutorials__list from "@/components/Tutorials__list.vue";
import Tutorial__details from "@/components/Tutorial__details.vue";
import Tutorial__emptyFieldLogo from "@/components/Tutorial__emptyFieldLogo.vue";
import { mapState, mapActions, mapGetters, mapMutations } from "vuex";
export default {
  name: "Tutorials__page",
  components: {
    Tutorials__list,
    Tutorial__details,
    Tutorial__emptyFieldLogo,
  },
  data() {
    return {
      // activeComponent is defined in mounted(){}
      activeComponent: "",
    };
  },
  computed: {
    ...mapState({
      tutorials: (state) => state.tutorials.tutorials,
      tutorial__details: (state) => state.tutorials.tutorial__details,
      tutorial__searchQuery: (state) => state.tutorials.tutorial__searchQuery,
      tutorial__published: (state) => state.tutorials.tutorial__published,
      currentUserSignedIn: (state) => state.auth.currentUserSignedIn,
      currentUserProfile: (state) => state.auth.currentUserProfile,
    }),
    ...mapGetters({
      displayTutorials: "tutorials/displayTutorials",
    }),
  },
  methods: {
    ...mapActions({
      getTutorials: "tutorials/getTutorials",
      getSearchedTutorial: "tutorials/getSearchedTutorial",
      deleteTutorials: "tutorials/deleteTutorials",
      getSingleTutorial: "tutorials/getSingleTutorial",
    }),
    ...mapMutations({
      setSearchQueryTutorial: "tutorials/setSearchQueryTutorial",
      setSingleAndSearchedTutorial: "tutorials/setSingleAndSearchedTutorial",
      setPublishedTutorial: "tutorials/setPublishedTutorial",
    }),
    searchTutorial() {
      this.setSingleAndSearchedTutorial(null);
      this.getSearchedTutorial();
      this.setSearchQueryTutorial("");
      this.activeComponent = "Tutorial__details";
    },
    deleteAllTutorials() {
      this.activeComponent = "Tutorial__emptyFieldLogo";
      this.deleteTutorials();
    },
    getDetailsSingleTutorial(id) {
      this.getSingleTutorial(id);
      this.activeComponent = "Tutorial__details";
    },
  },
  mounted() {
    this.getTutorials();
    // definition of activeComponent
    if (this.tutorial__details) {
      this.activeComponent = "Tutorial__details";
    } else {
      this.activeComponent = "Tutorial__emptyFieldLogo";
    }
  },
};
</script>

<style scoped lang="scss">
@import "@/assets/scss/colors.scss";

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
