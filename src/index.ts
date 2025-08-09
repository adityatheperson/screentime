import { registerPlugin } from '@capacitor/core';

import type { screentimePlugin } from './definitions';

const screentime = registerPlugin<screentimePlugin>('screentime', {
  web: () => import('./web').then((m) => new m.screentimeWeb()),
});

export * from './definitions';
export { screentime };
