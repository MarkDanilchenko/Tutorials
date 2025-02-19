<template>
  <section class="my-pagination">
    <nav aria-label="Page navigation" class="my-3">
      <ul class="pagination">
        <!-- First -->
        <li class="page-item" :class="{ disabled: currentPage === 1 }">
          <router-link class="page-link" to="#" aria-label="First" title="First" @click.prevent="changePage(1)"
            >First</router-link
          >
        </li>
        <!-- Previous -->
        <li class="page-item" :class="{ disabled: currentPage === 1 }">
          <router-link
            class="page-link"
            to="#"
            aria-label="Previous"
            title="Previous"
            @click.prevent="changePage(currentPage - 1)"
            >Previous</router-link
          >
        </li>
        <!-- Pages -->
        <li v-for="page in pages" :key="page" class="page-item" :class="{ active: page === currentPage }">
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
            >Next</router-link
          >
        </li>
        <!-- Last -->
        <li class="page-item" :class="{ disabled: currentPage === totalPages }">
          <router-link class="page-link" to="#" aria-label="Last" title="Last" @click.prevent="changePage(totalPages)"
            >Last</router-link
          >
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
      default: 5,
    },
  },
  computed: {},
};
</script>

<style lang="scss" scoped></style>
