import { html, nothing } from 'lit-html';
import { Components } from '../../components';
import { ArgTypes } from '@storybook/web-components';


import results from '../../../.jest-test-results.json';
import { withTests } from '@storybook/addon-jest';

//import docs from './my-component.docs.mdx';
import { Switch } from './switch';

export default {
  title: 'Components/Switch',
  component: 'zenit-switch',
  decorators: [withTests({ results })],
  parameters: {
    docs: {
      description: "A switch is a component typically used in settings to turn something on or off."
      //page: docs
    }
  },
  argTypes: {
    checked: {
      type: 'boolean',
      name: 'Checked',
      defaultValue: true,
      description: "Whether the switch is \"on\" or \"off\"."
    },
    disabled: {
      type: 'boolean',
      name: 'Disabled',
      defaultValue: false,
      description: "Whether the switch should be indicated as clickable."
    }
  } as unknown as ArgTypes<Switch>
}

export const Enabled = ({checked, disabled}) => html`<zenit-switch ?disabled=${disabled} ?checked=${checked} />`;
export const Disabled = Enabled.bind({});
Disabled.args = {
  disabled: true
}