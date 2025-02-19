<template>
  <section class="my-pagination">
    <nav aria-label="Page navigation" class="my-3">
      <ul class="pagination pagination-sm">
        <!-- First -->
        <li class="page-item" :class="{ disabled: currentPage === 1 }">
          <router-link class="page-link" to="#" aria-label="First" title="First" @click.prevent="changePage(1)">
            <span aria-hidden="true">❮❮</span>
          </router-link>
        </li>
        <!-- Previous -->
        <li class="page-item" :class="{ disabled: currentPage === 1 }">
          <router-link
            class="page-link"
            to="#"
            aria-label="Previous"
            title="Previous"
            @click.prevent="changePage(currentPage - 1)"
          >
            <span aria-hidden="true">❮</span>
          </router-link>
        </li>
        <!-- Pages -->
        <li v-for="page in visiblePages" :key="page" class="page-item" :class="{ active: page === currentPage }">
          <router-link class="page-link" to="#" @click.prevent="changePage(page)">{{ page }}</router-link>
        </li>
        <!-- Next -->
        <li class="page-item" :class="{ disabled: currentPage === totalPages }">
          <router-link
            class="page-link"
            to="#"
            aria-label="Next"
            title="Next"
            @click.prevent="changePage(currentPage + 1)"
          >
            <span aria-hidden="true">❯</span>
          </router-link>
        </li>
        <!-- Last -->
        <li class="page-item" :class="{ disabled: currentPage === totalPages }">
          <router-link class="page-link" to="#" aria-label="Last" title="Last" @click.prevent="changePage(totalPages)">
            <span aria-hidden="true">❯❯</span>
          </router-link>
        </li>
      </ul>
    </nav>
  </section>
</template>

<script>
export default {
  name: "Pagination",
  props: {
    currentPage: {
      type: Number,
      required: true,
    },
    totalItemsCount: {
      type: Number,
      required: true,
    },
    limit: {
      type: Number,
      required: true,
    },
    maxVisiblePages: {
      type: Number,
      default: 3,
    },
  },
  emits: ["pageChanged"],
  computed: {
    totalPages() {
      return Math.ceil(this.totalItemsCount / this.limit);
    },
    visiblePages() {
      const start = Math.max(1, this.currentPage - Math.floor(this.maxVisiblePages / 2));
      const end = Math.min(this.totalPages, start + this.maxVisiblePages - 1);

      return Array.from({ length: end - start + 1 }, (_, index) => start + index);
    },
  },
  methods: {
    changePage(page) {
      if (page >= 1 && page <= this.totalPages) {
        this.$emit("pageChanged", page);
      }
    },
  },
};
</script>

<style scoped lang="scss">
.my-pagination > nav {
  display: flex;
  justify-content: center;
  align-items: center;
  ul {
    margin: 0;
  }
}
</style>
