import { WebPlugin } from '@capacitor/core';

import type { screentimePlugin } from './definitions';

export class screentimeWeb extends WebPlugin implements screentimePlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
