<template>
  <section class="my-tutorials">
    <div id="mainLogo" class="d-flex justify-content-center align-items-center">
      <section class="wrapper">
        <div class="top">Tutorials</div>
        <div class="bottom" aria-hidden="true">Tutorials</div>
      </section>
    </div>
    <div class="row">
      <div class="d-flex justify-content-md-between flex-md-row flex-column">
        <!-- radios to filter Tutorials -->
        <div class="d-flex align-items-center justify-content-md-between justify-content-center mb-md-0 mb-3">
          <div class="form-check me-3">
            <input
              id="tutorialsAllRadio"
              class="form-check-input"
              type="radio"
              name="tutorialsRadio"
              checked
              @click="setFilterCondition('all')"
            />
            <label class="form-check-label text-small" for="tutorialsAllRadio">All</label>
          </div>
          <div class="form-check me-3">
            <input
              id="tutorialsPublishedRadio"
              class="form-check-input"
              type="radio"
              name="tutorialsRadio"
              @click="setFilterCondition('published')"
            />
            <label class="form-check-label text-small" for="tutorialsPublishedRadio">Published</label>
          </div>
          <div class="form-check">
            <input
              id="tutorialsNotPublishedRadio"
              class="form-check-input"
              type="radio"
              name="tutorialsRadio"
              @click="setFilterCondition('notPublished')"
            />
            <label class="form-check-label text-small" for="tutorialsNotPublishedRadio">Not published</label>
          </div>
        </div>
        <!-- search field -->
        <div class="d-flex align-items-center justify-content-md-between justify-content-center">
          <div class="form-floating me-1">
            <input
              id="searchField"
              v-model="inputSearchQuery"
              type="text"
              class="form-control"
              name="searchField"
              placeholder=""
            />
            <label for="searchField" class="text-muted">&#128269; search... </label>
          </div>
          <button id="searchBtn" class="btn btn-outline-green-custom" @click="searchTutorials">Search</button>
        </div>
      </div>
    </div>
    <div class="d-md-none">
      <hr />
    </div>
    <div v-if="tutorials.count">
      <div class="row">
        <!-- tutorials list(accordion), pagination, create/delete btns -->
        <div class="col-md-6 col-12 mb-md-0 mb-3">
          <TutorialsList :tutorials="tutorials.tutorials" @tutorial-info="tutorialInfo" />
          <div>
            <!-- pagination -->
            <!-- pagination -->
            <!-- pagination -->
            <!-- pagination -->
            <!-- pagination -->
            <!-- pagination -->
          </div>
          <div class="d-flex justify-content-center mt-3">
            <button v-if="isSignedIn" class="btn btn-outline-green-custom" @click="$router.push('/tutorials/create')">
              New Tutorial
            </button>
            <button
              v-if="isSignedIn && profile && (profile.is_staff || profile.is_superuser)"
              class="btn btn-danger ms-3"
              data-bs-toggle="modal"
              data-bs-target="#deleteAllTutorials"
            >
              Delete all
            </button>
          </div>
        </div>
        <!-- tutorials details and search filed -->
        <div class="col-md-6 col-12">
          <transition name="fade" mode="out-in">
            <component :is="activeComponent" />
          </transition>
        </div>
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
    <div v-else>
      <NotFound />
    </div>
  </section>
</template>

<script>
import { mapState, mapActions, mapMutations } from "vuex";
import TutorialsList from "@/components/TutorialsList.vue";
import TutorialInfo from "@/components/TutorialInfo.vue";
import TutorialEmptyBlock from "@/components/TutorialEmptyBlock.vue";
import NotFound from "@/components/NotFound.vue";

export default {
  name: "Tutorials",
  components: {
    TutorialsList,
    TutorialInfo,
    TutorialEmptyBlock,
    NotFound,
  },
  data() {
    return {
      // activeComponent is ether info or search component;
      activeComponent: "",
      inputSearchQuery: "",
    };
  },
  computed: {
    ...mapState({
      isSignedIn: (state) => state.auth.isSignedIn,
      profile: (state) => state.auth.profile,
      tutorials: (state) => state.tutorials.tutorials,
      tutorial: (state) => state.tutorials.tutorial,
    }),
  },
  watch: {
    tutorial() {
      this.activeComponent = this.tutorial ? "TutorialInfo" : "TutorialEmptyBlock";
    },
  },
  mounted() {
    this.activeComponent = "TutorialEmptyBlock";
    this.tutorialsList();
  },
  methods: {
    ...mapActions({
      tutorialsList: "tutorials/tutorialsList",
      tutorialItem: "tutorials/tutorialItem",
      //     getSearchedTutorial: "tutorials/getSearchedTutorial",
      //     deleteTutorials: "tutorials/deleteTutorials",
    }),
    ...mapMutations({
      //     setSearchQueryTutorial: "tutorials/setSearchQueryTutorial",
      //     setSingleAndSearchedTutorial: "tutorials/setSingleAndSearchedTutorial",
      setFilterCondition: "tutorials/setFilterCondition",
    }),
    searchTutorials() {},
    tutorialInfo(id) {
      this.tutorialItem(id);
    },
    //   searchTutorial() {
    //     this.setSingleAndSearchedTutorial(null);
    //     this.getSearchedTutorial();
    //     this.setSearchQueryTutorial("");
    //     this.activeComponent = "Tutorial__details";
    //   },
    //   deleteAllTutorials() {
    //     this.activeComponent = "Tutorial__emptyFieldLogo";
    //     this.deleteTutorials();
    //   },
  },
};
</script>

<style scoped lang="scss">
@import "@/assets/scss/colors.scss";

#searchBtn {
  height: 100%;
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
