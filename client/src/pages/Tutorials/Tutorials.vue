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
        <!-- radios to filter Tutorials and display per page selector -->
        <div class="d-flex justify-content-md-between justify-content-around mb-3 col-md-6 col-12">
          <div class="d-flex flex-column ms-md-3 ms-0">
            <span class="text-small text-muted">Filter by:</span>
            <div class="form-check me-3">
              <input
                id="tutorialsAllRadio"
                class="form-check-input"
                type="radio"
                name="tutorialsRadio"
                checked
                @click="setFilter('')"
              />
              <label class="form-check-label text-small" for="tutorialsAllRadio">All</label>
            </div>
            <div class="form-check me-3">
              <input
                id="tutorialsPublishedRadio"
                class="form-check-input"
                type="radio"
                name="tutorialsRadio"
                @click="setFilter('published')"
              />
              <label class="form-check-label text-small" for="tutorialsPublishedRadio">Published</label>
            </div>
            <div class="form-check">
              <input
                id="tutorialsNotPublishedRadio"
                class="form-check-input"
                type="radio"
                name="tutorialsRadio"
                @click="setFilter('notPublished')"
              />
              <label class="form-check-label text-small" for="tutorialsNotPublishedRadio">Not published</label>
            </div>
          </div>
          <div class="me-md-3 me-0">
            <span class="text-small text-muted">Display per:</span>
            <select v-model="limit" class="form-select form-select-sm" aria-label="Pagination limit">
              <option value="5" selected>5</option>
              <option value="10">10</option>
              <option value="15">15</option>
            </select>
          </div>
        </div>
        <!-- search field -->
        <div class="d-flex flex-column align-items-center">
          <div class="d-flex align-items-center justify-content-center">
            <div class="form-floating me-1">
              <input
                id="searchField"
                type="text"
                class="form-control"
                name="searchField"
                placeholder=""
                @input="setSearchQuery($event.target.value)"
              />
              <label for="searchField" class="text-muted">&#128269; search... </label>
            </div>
            <button id="searchBtn" class="btn btn-outline-green-custom" @click="searchTutorials">Search</button>
          </div>
          <span class="text-small text-muted"><i>Search via title and description</i></span>
        </div>
      </div>
    </div>
    <div class="d-md-none">
      <hr />
    </div>
    <div v-if="tutorials && tutorials.count">
      <div class="row">
        <!-- tutorials list(accordion), pagination, deleteAll/create btns -->
        <div class="col-md-6 col-12 mb-md-0 mb-3">
          <TutorialsList :tutorials="tutorials.tutorials" @tutorial-info="tutorialInfo" />
          <Pagination
            :current-page="currentPage"
            :total-items-count="tutorials.count"
            :limit="limit"
            @change-page="changePage"
          />
          <div class="d-flex justify-content-center mt-3">
            <button v-if="isSignedIn" class="btn btn-outline-green-custom" @click="$router.push('/tutorials/create')">
              New Tutorial
            </button>
            <button
              v-if="isSignedIn && profile && (profile.is_staff || profile.is_superuser)"
              class="btn btn-danger ms-3"
              data-bs-toggle="modal"
              data-bs-target="#deleteTutorials"
            >
              Delete all
            </button>
          </div>
        </div>
        <!-- tutorials info field -->
        <div class="col-md-6 col-12">
          <transition name="fade" mode="out-in">
            <component :is="activeComponent" />
          </transition>
        </div>
        <!-- Delete all Tutorials modal -->
        <DeleteTutorialsModal />
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
import DeleteTutorialsModal from "@/components/DeleteTutorialsModal.vue";
import NotFound from "@/components/NotFound.vue";
import Pagination from "@/components/Pagination.vue";

export default {
  name: "Tutorials",
  components: {
    TutorialsList,
    TutorialInfo,
    TutorialEmptyBlock,
    DeleteTutorialsModal,
    NotFound,
    Pagination,
  },
  data() {
    return {
      // activeComponent is ether info or empty block component;
      activeComponent: "",
      currentPage: 1,
      limit: 5,
    };
  },
  computed: {
    ...mapState({
      isSignedIn: (state) => state.auth.isSignedIn,
      profile: (state) => state.auth.profile,
      tutorials: (state) => state.tutorials.tutorials,
      tutorial: (state) => state.tutorials.tutorial,
      filter: (state) => state.tutorials.filter,
    }),
  },
  watch: {
    tutorial() {
      this.activeComponent = this.tutorial ? "TutorialInfo" : "TutorialEmptyBlock";
    },
    filter() {
      this.tutorialsList();
    },
    limit() {
      this.currentPage = 1;
      this.tutorialsList({
        page: this.currentPage,
        limit: this.limit,
      });
    },
  },
  mounted() {
    this.activeComponent = this.tutorial ? "TutorialInfo" : "TutorialEmptyBlock";
    this.tutorialsList();
  },
  methods: {
    ...mapActions({
      tutorialsList: "tutorials/tutorialsList",
      tutorialItem: "tutorials/tutorialItem",
    }),
    ...mapMutations({
      setFilter: "tutorials/setFilter",
      setSearchQuery: "tutorials/setSearchQuery",
    }),
    searchTutorials() {
      this.tutorialsList();
      this.setSearchQuery("");
      $("#searchField").val("");
    },
    tutorialInfo(id) {
      this.tutorialItem(id);
    },
    changePage(page) {
      this.currentPage = page;
      this.tutorialsList({
        page: this.currentPage,
        limit: this.limit,
      });
    },
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
