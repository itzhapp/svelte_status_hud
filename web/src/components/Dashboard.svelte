<script lang="ts">
    import Circle from "../lib/Circle.svelte";
    import { useNuiEvent } from "../utils/useNuiEvent";

    useNuiEvent("updateHunger", (status : number) => {
        hungerPlayer = 100 - status;
    });

    useNuiEvent("updateThirst", (status : number) => {
        thirstPlayer = 100 - status;
    });

    useNuiEvent("updateStress", (status : number) => {
        stressPlayer = 100 - status;
    });

    useNuiEvent("updateHealth", (status : number) => {
        healthPlayer = status;
    });

    useNuiEvent("updateArmor", (status : number) => {
        armorPlayer = status;
    });

    useNuiEvent("updateStamina", (status : number) => {
        staminaPlayer = 100 - status;
    });

    let healthPlayer = 100;
    let armorPlayer = 0;
    let staminaPlayer = 100;
    let hungerPlayer = 100;
    let thirstPlayer = 100;
    let stressPlayer = 0;
</script>

<div class="container">
    <!-- Circle for Health -->
    {#if healthPlayer < 100}
    <Circle
        width={50}
        lineWidth={30}
        bgColor="hsla(0, 0%, 100%, 1)"
        color={healthPlayer >= 75
            ? "hsla(150, 100%, 40%, 1)"
            : healthPlayer >= 50
            ? "hsla(40, 100%, 50%, 1)"
            : "hsla(0, 80%, 50%, 1)"}
        textColor="hsla(0, 0%, 20%, 1)"
        responsive={false}
        percent={healthPlayer}
        rounded={false}
        animation={true}
        iconText="heart"
    />
    {/if}

    <!-- Circle for Armor -->
    {#if armorPlayer > 0}
    <Circle
        width={50}
        lineWidth={30}
        bgColor="hsla(0, 0%, 100%, 1)"
        color={armorPlayer >= 75
            ? "hsla(150, 100%, 40%, 1)"
            : armorPlayer >= 50
            ? "hsla(40, 100%, 50%, 1)"
            : "hsla(0, 80%, 50%, 1)"}
        textColor="hsla(0, 0%, 20%, 1)"
        responsive={false}
        percent={armorPlayer}
        rounded={false}
        animation={true}
        iconText="shield"
    />
    {/if}

    <!-- Circle for Thirst -->
    {#if thirstPlayer < 100}
    <Circle
        width={50}
        lineWidth={30}
        bgColor="hsla(0, 0%, 100%, 1)"
        color={thirstPlayer >= 75
            ? "hsla(150, 100%, 40%, 1)"
            : thirstPlayer >= 50
            ? "hsla(40, 100%, 50%, 1)"
            : "hsla(0, 80%, 50%, 1)"}
        textColor="hsla(0, 0%, 20%, 1)"
        responsive={false}
        percent={thirstPlayer}
        rounded={false}
        animation={true}
        iconText="water"
        iconX={"29%"}
        
    />
    {/if}
    

    <!-- Circle for Hunger -->
    {#if hungerPlayer < 100}
    <Circle
        width={50}
        lineWidth={30}
        bgColor="hsla(0, 0%, 100%, 1)"
        color={hungerPlayer >= 75
            ? "hsla(150, 100%, 40%, 1)"
            : hungerPlayer >= 50
            ? "hsla(40, 100%, 50%, 1)"
            : "hsla(0, 80%, 50%, 1)"}
        textColor="hsla(0, 0%, 20%, 1)"
        responsive={false}
        percent={hungerPlayer}
        rounded={false}
        animation={true}
        iconText="burger"
        iconX={"25%"}
    />
    {/if}

    <!-- Circle for Stress -->
    {#if stressPlayer > 0}
    <Circle
        width={50}
        lineWidth={30}
        bgColor="hsla(0, 0%, 100%, 1)"
        color={stressPlayer >= 75
            ? "hsla(150, 100%, 40%, 1)"
            : stressPlayer >= 50
            ? "hsla(40, 100%, 50%, 1)"
            : "hsla(0, 80%, 50%, 1)"}
        textColor="hsla(0, 0%, 20%, 1)"
        responsive={false}
        percent={stressPlayer}
        rounded={false}
        animation={true}
        iconText="brain"
    />
    {/if}

    <!-- Circle for Stamina -->
    {#if staminaPlayer < 100}
    <Circle
        width={50}
        lineWidth={30}
        bgColor="hsla(0, 0%, 100%, 1)"
        color={staminaPlayer >= 75
            ? "hsla(150, 100%, 40%, 1)"
            : staminaPlayer >= 25
            ? "hsla(40, 100%, 50%, 1)"
            : "hsla(0, 80%, 50%, 1)"}
        textColor="hsla(0, 0%, 20%, 1)"
        responsive={false}
        percent={staminaPlayer}
        rounded={false}
        animation={true}
        iconText="bolt"
    />
    {/if}
</div>

<style>
    .container {
        display: flex;
        justify-content: space-evenly;
        align-items: flex-end;
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        height: 100%;
        width: 5%;
    }
</style>
