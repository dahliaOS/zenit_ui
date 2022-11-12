import { html, nothing } from 'lit-html';
import { Components } from '../../components';
import { ArgTypes } from '@storybook/web-components';

//import docs from './my-component.docs.mdx';
import { Button } from './button';

export default {
  title: 'Components/Button',
  component: 'zenit-button',
  parameters: {
    docs: {
      description: "A button is an interactive component which, when tapped or clicked, performs some action."
      //page: docs
    }
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

export const PrimaryDisabled = ({label, disabled}) => html`<zenit-button primary ?disabled=${disabled}>${label}</zenit-button>`
PrimaryDisabled.args = {
  disabled: true
}