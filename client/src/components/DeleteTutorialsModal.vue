<template>
  <section class="my-deleteTutorialsModal">
    <div id="deleteTutorials" class="modal fade" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Delete All Tutorials</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p>
              Are you sure you want to delete all tutorials?
              <br /><br />
              <span><b>This action can not be undone!</b></span>
            </p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" @click="deleteTutorials">
              Delete all
            </button>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import { mapActions } from "vuex";

export default {
  name: "DeleteTutorialsModal",
  methods: {
    ...mapActions({}),
    deleteTutorials() {},
  },
};
</script>

<style scoped lang="scss">
.modal-body span {
  color: $red_color;
}
</style>
