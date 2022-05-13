<script lang="ts">
import { defineComponent } from "vue";
import { invoke } from "@tauri-apps/api";
import { ref } from "vue";
import { ColorInputWithoutInstance } from "tinycolor2";
export default defineComponent({
    setup() {
        const send = () => {
            invoke("log")
        }
        const pureColor = ref<ColorInputWithoutInstance>("red");
        const gradientColor = ref("linear-gradient(0deg, rgba(0, 0, 0, 1) 0%, rgba(0, 0, 0, 1) 100%)");

        return {
            send,
            gradientColor,
            pureColor
        }
    }
});
</script>
<template>
    <h2>This is a Vue 3 component!</h2>
    <div>
        <color-picker v-model:pureColor="pureColor" v-model:gradientColor="gradientColor" />
    </div>
    <hr>
    <button @click="send">Clicked</button>
</template>