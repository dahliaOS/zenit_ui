import { newSpecPage } from "@stencil/core/testing";
import { Textbox } from "./textbox";

describe('zenit-textbox', () => {
  it('renders', async () => {
    const { root } = await newSpecPage({
      components: [Textbox],
      html: '<zenit-textbox />',
    });
    expect(root).toEqualHtml(/*html*/`
      <zenit-textbox>
        <mock:shadow-root>
          <label class="--container">
            <div class="--row">
              <slot name="prefix"></slot>
              <input caseinsensitive="" class="--input" type="text">
              <slot name="suffix"></slot>
            </div>
          </label>
        </mock:shadow-root>
      </zenit-textbox>
    `);
  });

  it('renders its label', async () => {
    const { root } = await newSpecPage({
      components: [Textbox],
      html: '<zenit-textbox label="Hallo Welt!" />',
    });
    expect(root).toEqualHtml(/*html*/`
      <zenit-textbox label="Hallo Welt!">
        <mock:shadow-root>
          <label class="--container">
            <span class="--label">Hallo Welt!</span>
            <div class="--row">
              <slot name="prefix"></slot>
              <input caseinsensitive="" class="--input" type="text">
              <slot name="suffix"></slot>
            </div>
          </label>
        </mock:shadow-root>
      </zenit-textbox>
    `);
  });

  it('renders its placeholder', async () => {
    const { root } = await newSpecPage({
      components: [Textbox],
      html: '<zenit-textbox placeholder="Enter your email address" />',
    });
    expect(root).toEqualHtml(/*html*/`
      <zenit-textbox placeholder="Enter your email address">
        <mock:shadow-root>
          <label class="--container">
            <div class="--row">
              <slot name="prefix"></slot>
              <input caseinsensitive="" class="--input" type="text" placeholder="Enter your email address">
              <slot name="suffix"></slot>
            </div>
          </label>
        </mock:shadow-root>
      </zenit-textbox>
    `);
  });

  it('renders as disabled', async () => {
    const { root } = await newSpecPage({
      components: [Textbox],
      html: '<zenit-textbox disabled />',
    });
    expect(root).toEqualHtml(/*html*/`
      <zenit-textbox disabled>
        <mock:shadow-root>
          <label class="--container" data-disabled>
            <div class="--row">
              <slot name="prefix"></slot>
              <input caseinsensitive="" class="--input" type="text" disabled>
              <slot name="suffix"></slot>
            </div>
          </label>
        </mock:shadow-root>
      </zenit-textbox>
    `);
  });

  it('renders prefix', async () => {
    const { root } = await newSpecPage({
      components: [Textbox],
      html: '<zenit-textbox><span slot="prefix">Prefix</span></zenit-textbox>',
    });
    expect(root).toEqualHtml(/*html*/`
      <zenit-textbox>
        <mock:shadow-root>
          <label class="--container">
            <div class="--row">
              <slot name="prefix"></slot>
              <input caseinsensitive="" class="--input" type="text">
              <slot name="suffix"></slot>
            </div>
          </label>
        </mock:shadow-root>
        <span slot="prefix">Prefix</span>
      </zenit-textbox>
    `);
  });

  it('renders suffix', async () => {
    const { root } = await newSpecPage({
      components: [Textbox],
      html: '<zenit-textbox><span slot="suffix">Suffix</span></zenit-textbox>',
    });
    expect(root).toEqualHtml(/*html*/`
      <zenit-textbox>
        <mock:shadow-root>
          <label class="--container">
            <div class="--row">
              <slot name="prefix"></slot>
              <input caseinsensitive="" class="--input" type="text">
              <slot name="suffix"></slot>
            </div>
          </label>
        </mock:shadow-root>
        <span slot="suffix">Suffix</span>
      </zenit-textbox>
    `);
  });
});