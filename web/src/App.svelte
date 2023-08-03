<script lang="ts">
  import VisibilityProvider from './providers/VisibilityProvider.svelte';
  import { debugData } from './utils/debugData';
  import Dashboard from './components/Dashboard.svelte';

  debugData([
    {
      action: 'setVisible',
      data: true,
    },
  ]);
</script>

<main>
  <VisibilityProvider>
    <Dashboard />
  </VisibilityProvider>
</main>
