<template>
  <section class="my-TutorialUpdate">
    <div class="row">
      <div class="d-flex flex-column justify-content-center align-items-center mt-5">
        <form id="updateTutorial__form" action="" class="col-lg-6 col-md-8 col-10" name="updateTutorial__form">
          <fieldset class="form-group mb-3">
            <legend class="border-bottom text-center mb-3">Update Tutorial</legend>
            <div class="mb-3">
              <label for="tutorialTitle" class="form-label">
                <b><sup>*</sup>Title:</b>
              </label>
              <input
                id="tutorialTitle"
                v-model="form.title"
                v-focusCustom
                type="text"
                class="form-control"
                aria-describedby="tutorialTitleHelp"
                placeholder="Title"
                @input="v$.form.title.$touch()"
              />
              <div v-if="v$.form.title.required.$invalid" class="text-secondary text-small">
                This field is required.
              </div>
              <div v-if="v$.form.title.maxLength.$invalid" class="text-danger text-small">
                Title should not be longer than {{ v$.form.title.maxLength.$params.max }} symbols.
              </div>
            </div>
            <div class="mb-3">
              <label for="tutorialDescription" class="form-label"><b>Description:</b></label>
              <textarea
                id="tutorialDescription"
                v-model="form.description"
                class="form-control"
                rows="5"
                cols="30"
                placeholder="Description"
                @input="v$.form.description.$touch()"
              ></textarea>
              <div v-if="v$.form.description.maxLength.$invalid" class="text-danger text-small">
                Description should not be longer than {{ v$.form.description.maxLength.$params.max }} symbols.
              </div>
            </div>
            <div class="form-check mb-3">
              <input
                id="isPublished"
                v-model="form.isPublished"
                type="checkbox"
                class="form-check-input"
                name="isPublished"
                aria-describedby="isPublishedHelp"
              />
              <label class="form-check-label" for="isPublished"><b>Published</b></label>
            </div>
          </fieldset>
          <div class="d-flex justify-content-center align-items-center">
            <button
              class="btn btn-outline-green-custom"
              type="submit"
              :disabled="btnDisabled"
              @click.prevent="updateTutorial"
            >
              Update!
            </button>
          </div>
        </form>
        <div v-if="createOrUpdateError" class="d-flex justify-content-center">
          <p class="text-danger mt-3">{{ createOrUpdateError }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapActions, mapMutations, mapState } from "vuex";
import { useVuelidate } from "@vuelidate/core";
import { maxLength, required } from "@vuelidate/validators";

export default {
  name: "TutorialUpdate",
  setup() {
    return {
      v$: useVuelidate(),
    };
  },
  data() {
    return {
      form: {
        title: "",
        description: "",
        isPublished: false,
      },
    };
  },
  validations() {
    return {
      form: {
        title: {
          required,
          maxLength: maxLength(100),
        },
        description: {
          maxLength: maxLength(1000),
        },
      },
    };
  },
  computed: {
    ...mapState({
      createOrUpdateError: (state) => state.tutorials.createOrUpdateError,
      tutorial: (state) => state.tutorials.tutorial,
    }),
    btnDisabled() {
      return this.v$.$invalid ? true : false;
    },
  },
  async mounted() {
    const tutorialId = this.$route.params.id;

    if (!this.tutorial) {
      await this.tutorialItem(tutorialId);
    }
    // Fill form with current tutorial's data;
    this.form.title = this.tutorial.title;
    this.form.description = this.tutorial.description;
    this.form.isPublished = this.tutorial.isPublished;

    this.setCreateOrUpdateError(null);
  },
  methods: {
    ...mapActions({
      updateTutorialAction: "tutorials/updateTutorial",
      tutorialItem: "tutorials/tutorialItem",
    }),
    ...mapMutations({
      setCreateOrUpdateError: "tutorials/setCreateOrUpdateError",
    }),
    async updateTutorial() {
      const tutorialId = this.$route.params.id;

      await this.updateTutorialAction({
        id: tutorialId,
        title: this.form.title,
        description: this.form.description,
        isPublished: this.form.isPublished,
      });

      if (!this.createOrUpdateError) {
        await this.tutorialItem(tutorialId);
        this.$router.push("/tutorials");
      }
    },
  },
};
</script>

<style scoped lang="scss"></style>
