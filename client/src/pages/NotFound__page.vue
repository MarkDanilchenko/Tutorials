<template>
    <section class="my-notFound">
        <div class="d-flex flex-column justify-content-center align-items-center notFoundPage">
            <p class="text-center">
                <span class="text-green">404</span>
                <br>Page not found
            </p>
            <button @click="$router.go(-1)" class="btn btn-outline-custom-green">Back</button>
        </div>
    </section>
</template>

<script>
export default {
    name: 'NotFound__page'
}
</script>

<style scoped lang="scss">
.notFoundPage {
    font-size: 5rem;
    position: absolute;
    top: 45%;
    left: 50%;
    transform: translate(-50%, -50%);
}
</style>