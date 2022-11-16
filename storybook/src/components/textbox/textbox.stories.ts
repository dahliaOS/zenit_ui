import { html } from 'lit-html';
import { ArgTypes } from '@storybook/web-components';

import results from '../../../.jest-test-results.json';
import { withTests } from '@storybook/addon-jest';

//import docs from './my-component.docs.mdx';
import { Textbox } from './textbox';

export default {
  title: 'Components/Textbox',
  component: 'zenit-textbox',
  decorators: [withTests({ results })],
  parameters: {
    docs: {
      //page: docs
    }
  },
  argTypes: {
    label: {
      type: 'string',
      name: 'Label',
      description: "The textbox's label, which displays above it."
    },
    placeholder: {
      type: 'string',
      name: 'Placeholder text',
      description: "Greyed-out text which appears inside the textbox when it is empty. This isn't counted as an input.",
    },
    value: {
      type: 'string',
      name: 'Value',
      description: "The text that the user has entered."
    },
    disabled: {
      type: 'boolean',
      name: 'Disabled',
      description: "Whether the textbox should be indicated as usable."
    },
    required: {
      type: 'boolean',
      name: 'Required',
      description: "Whether the textbox should be indicated as required."
    },
  } as ArgTypes<Textbox>
}

export const Simple = ({label, placeholder, value, disabled, required}) => html`<zenit-textbox label=${label} placeholder=${placeholder} value=${value} ?disabled=${disabled} ?required=${required} />`;

export const WithExfixes = ({label, placeholder, value, disabled, required}) => html`<zenit-textbox label=${label} placeholder=${placeholder} value=${value} ?disabled=${disabled} ?required=${required}>
  <zenit-button rounded icon disabled slot="prefix">
    <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.42 4.58a5.4 5.4 0 0 0-7.65 0l-.77.78-.77-.78a5.4 5.4 0 0 0-7.65 0C1.46 6.7 1.33 10.28 4 13l8 8 8-8c2.67-2.72 2.54-6.3.42-8.42z"></path><path d="M12 5.36 8.87 8.5a2.13 2.13 0 0 0 0 3h0a2.13 2.13 0 0 0 3 0l2.26-2.21a3 3 0 0 1 4.22 0l2.4 2.4"></path><path d="m18 15-2-2"></path><path d="m15 18-2-2"></path></svg>
  </zenit-button>
  <zenit-button rounded icon slot="suffix">
    <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20.42 4.58a5.4 5.4 0 0 0-7.65 0l-.77.78-.77-.78a5.4 5.4 0 0 0-7.65 0C1.46 6.7 1.33 10.28 4 13l8 8 8-8c2.67-2.72 2.54-6.3.42-8.42z"></path><path d="M12 5.36 8.87 8.5a2.13 2.13 0 0 0 0 3h0a2.13 2.13 0 0 0 3 0l2.26-2.21a3 3 0 0 1 4.22 0l2.4 2.4"></path><path d="m18 15-2-2"></path><path d="m15 18-2-2"></path></svg>
  </zenit-button>
</zenit-textbox>`;
WithExfixes.storyName = "With Prefix and Suffix";

export const Required = Simple.bind({});
Required.args = {
  required: true
};

export const Disabled = Simple.bind({});
Disabled.args = {
  disabled: true
};
