import { html, nothing } from 'lit-html';
import { Components } from '../../components';
import { ArgTypes } from '@storybook/web-components';

import results from '../../../.jest-test-results.json';
import { withTests } from '@storybook/addon-jest';

//import docs from './my-component.docs.mdx';
import { Button } from './button';

export default {
  title: 'Components/Button',
  component: 'zenit-button',
  decorators: [withTests({ results })],
  parameters: {
    docs: {
      description: "A button is an interactive component which, when tapped or clicked, performs some action."
      //page: docs
    },
    actions: {
      handles: ['click'],
    },
  },
  argTypes: {
    label: {
      type: 'string',
      name: 'Label',
      defaultValue: "Button",
      description: "The label to display on the button; the button's child(ren)."
    },
    disabled: {
      type: 'boolean',
      name: 'Disabled',
      defaultValue: false,
      description: "Whether the button should be indicated as clickable."
    }
  } as unknown as ArgTypes<Button>
};

export const Primary = ({label, disabled}) => html`<zenit-button primary ?disabled=${disabled}>${label}</zenit-button>`
Primary.parameters = {
  docs: {
    description: "Only one button in any given set should be primary, and it should correspond to the preferred or most used action, "+
    "such as canceling a deletion, starting a virtual machine, or moving to the next step."
  },
  backgrounds: {
    disable: false,
    items: [
      {
        name: "light",
        color: "#ffffff",
      },
      {
        name: "dark",
        color: "#121212",
      }
    ],
  }
}

export const Secondary = ({label, disabled}) => html`<zenit-button ?disabled=${disabled}>${label}</zenit-button><style>
.dark {
  --zenit-theme-secondary: #262626;
  --zenit-theme-on-secondary: #ffffff;
  background-color: #121212;
}</style>`
Secondary.parameters = {
  themes: [
    {
      name: "light",
      class: "",
      color: "#fafafa",
    },
    {
      name: "dark",
      class: "dark",
      color: "#212121",
    }
  ],
}

export const Tertiary = ({label, disabled}) => html`<zenit-button transparent ?disabled=${disabled}>${label}</zenit-button><style>
.dark {
  --zenit-theme-secondary: #262626;
  --zenit-theme-on-secondary: #ffffff;
  background-color: #121212;
}</style>`
Tertiary.storyName = "Transparent";
Tertiary.parameters = {
  themes: [
    {
      name: "light",
      class: "",
      color: "#fafafa",
    },
    {
      name: "dark",
      class: "dark",
      color: "#212121",
    }
  ],
}

export const Rounded = ({label, disabled}) => html`<zenit-button primary rounded ?disabled=${disabled}>${label}</zenit-button>`
Rounded.storyName = "Rounded Rectangle";
Rounded.argTypes = {
  primary: {
    type: 'boolean',
    name: 'Primary style',
    defaultValue: true,
    description: "Whether to use the primary style for the button."
  },
}

export const Icon = ({primary, disabled}) => html`<zenit-button ?primary=${primary} icon ?disabled=${disabled}>
  <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.42 4.58a5.4 5.4 0 0 0-7.65 0l-.77.78-.77-.78a5.4 5.4 0 0 0-7.65 0C1.46 6.7 1.33 10.28 4 13l8 8 8-8c2.67-2.72 2.54-6.3.42-8.42z"></path><path d="M12 5.36 8.87 8.5a2.13 2.13 0 0 0 0 3h0a2.13 2.13 0 0 0 3 0l2.26-2.21a3 3 0 0 1 4.22 0l2.4 2.4"></path><path d="m18 15-2-2"></path><path d="m15 18-2-2"></path></svg>
</zenit-button>`
Icon.argTypes = {
  primary: {
    type: 'boolean',
    name: 'Primary style',
    defaultValue: true,
    description: "Whether to use the primary style for the button."
  },
}

export const PrimaryDisabled = ({label, disabled}) => html`<zenit-button primary ?disabled=${disabled}>${label}</zenit-button>`
PrimaryDisabled.args = {
  disabled: true
}